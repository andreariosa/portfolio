<?php
//A.R. 2021-05-15
include('class.phpmailer.php');
header('Content-Type: application/json');

// Remember to "chmod 400 config.ini"
$env = parse_ini_file('config.ini');
$ip_address_env = get_client_ip_env();

$protocol = ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
$url_dir = $protocol . $_SERVER['HTTP_HOST'] . '/php';
$url_file = $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

$_POST = json_decode(file_get_contents('php://input'), true);

// https://github.com/PHPMailer/PHPMailer
$use_phpmailer  = $env["phpmailer"];
$mail_Host      = $env["host"];
$mail_SMTPsec   = $env["smtpsec"];
$mail_Port      = $env["port"];
$mail_username  = $env["username"];
$mail_password  = $env["secret"];

// Check IP address on the IP Blacklist
if($fh = fopen('mail_blacklist.txt', 'r'))
{
    while (!feof($fh)) {
        $line = fgets($fh);
        $line = preg_replace("/\r|\n/", "", $line);

        if(strcmp($ip_address_env, $line) == 0)
        {
            file_put_contents('mail_logs.txt', "[".date("Y-m-d H:i:s")."] FALL ".$ip_address_env." (from website)".PHP_EOL , FILE_APPEND | LOCK_EX);
            echo json_encode('BlacklistdIpFound');
            return false;
            die();
        }
    }
    file_put_contents('mail_logs.txt', "[".date("Y-m-d H:i:s")."] PASS ".$ip_address_env." (from website)".PHP_EOL , FILE_APPEND | LOCK_EX);
    fclose($fh);
}

// Use external API to check IP address score and eventually add it to the IP Blacklist
if(!call_abuseIPDB($ip_address_env, $env["key"]))
{
    echo json_encode('BlacklistdIpFromApi');
    return false;
    die();
}

// Manually add an IP address to the IP Blacklist
if(!empty($_GET['ip']) && filter_var($_GET['ip'], FILTER_VALIDATE_IP))
{
    file_put_contents('mail_blacklist.txt', $_GET['ip'].PHP_EOL , FILE_APPEND | LOCK_EX);
    file_put_contents('mail_logs.txt', "[".date("Y-m-d H:i:s")."] MANU ".$_GET['ip']." (from email)".PHP_EOL , FILE_APPEND | LOCK_EX);
    echo "New address ".$_GET['ip']." added to the IP Blacklist!\n";
    return true;
    die();
}

// Check empty form fields and validate email
if(empty($_POST['name']) || empty($_POST['email']) || empty($_POST['message']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
{
    echo json_encode('FormFieldsError');
    return false;
    die();
}

$name = strip_tags(htmlspecialchars($_POST['name']));
$email_address = strip_tags(htmlspecialchars($_POST['email']));
$message = strip_tags(htmlspecialchars($_POST['message']));
$ip_block_env = "Block $url_file?ip=$ip_address_env";
$ip_block_list = "List $url_dir/mail_blacklist.txt";
$ip_block_logs = "Logs $url_dir/mail_logs.txt";

// Create the email and send the message
$to = $env["my_email"];
$email_subject = "From '$name'";
$email_body = "New message from your contact form.\n\nName: $name\nEmail: $email_address\n\nMessage:\n$message\n\nIP Blacklisting:\n$ip_block_env\n$ip_block_list\n$ip_block_logs";
$headers = array(
    'From' => 'contact.form@yoursite.com',
    'Reply-To' => $email_address,
    'X-Mailer' => 'PHP/' . phpversion()
);

if(!$use_phpmailer)
{
    if(mail($to, $email_subject, $email_body, $headers))
    {
        echo json_encode('Sent');
        return true;
    } else {
        echo json_encode('MailFailToSend');
        return false;
    }
}
else
{
    $mail = new PHPMailer;

    $mail->IsSMTP();
    $mail->SMTPAuth = true;
    $mail->SMTPKeepAlive = "true";

    $mail->Host = $mail_Host;
    $mail->SMTPSecure = $mail_SMTPsec;
    $mail->Port = $mail_Port;
    $mail->Username = $mail_username;
    $mail->Password = $mail_password;

    $mail->From = $email_address;
    $mail->FromName = $name;
    $mail->Subject = $email_subject;
    $mail->AddAddress($to);
    $mail->Body = $email_body;

    if($mail->Send())
    {
        echo json_encode('SentWithPHPMailer');
        return true;
    } else {
        echo json_encode('PHPMailerFailToSend');
        return false;
    }
}

function get_client_ip_env() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
        $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';

    return $ipaddress;
}

function call_api($method, $url, $data, $headers) {
    $curl = curl_init();
    switch ($method)
    {
        case "POST":
            curl_setopt($curl, CURLOPT_POST, 1);
            if ($data)
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        case "PUT":
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "PUT");
            if ($data)
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        default:
            if ($data)
                $url = sprintf("%s?%s", $url, http_build_query($data));
    }

    // Options
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);

    // Execute
    $result = curl_exec($curl);
    if(!$result)
    {
        return false;
    }
    curl_close($curl);

    return $result;
}

// AbuseIPDB docs https://docs.abuseipdb.com/#check-endpoint
function call_abuseIPDB($ip_address, $key) {
    $headers = array(
        'accept: application/json',
        'key: '.$key,
    );
    $get_data = call_api('GET', 'https://api.abuseipdb.com/api/v2/check?ipAddress='.$ip_address, false, $headers);
    $response = json_decode($get_data, true);
    $score = $response['data']['abuseConfidenceScore'];

    if(is_null($score))
    {
        file_put_contents('mail_logs.txt', "[".date("Y-m-d H:i:s")."] AUTO ".$ip_address." (API ERROR)".PHP_EOL , FILE_APPEND | LOCK_EX);
        echo json_encode($response);
        return false;
        die();
    }

    // Check score
    if($score >= 20)
    {
        file_put_contents('mail_blacklist.txt', $ip_address.PHP_EOL , FILE_APPEND | LOCK_EX);
        file_put_contents('mail_logs.txt', "[".date("Y-m-d H:i:s")."] AUTO ".$ip_address." (score = ".$score.")".PHP_EOL , FILE_APPEND | LOCK_EX);
        return false;
    }
    return true;
}
?>
