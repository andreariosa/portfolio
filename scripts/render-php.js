'use strict'
const fs = require('fs')
const upath = require('upath')
const sh = require('shelljs')

module.exports = function renderPhp() {
  const sourcePath = upath.resolve(upath.dirname(__filename), '../src/php')
  const destPath = upath.resolve(upath.dirname(__filename), '../dist/.')
  const deletePath = upath.resolve(upath.dirname(__filename), '../dist/php')

  sh.cp('-R', sourcePath, destPath)
  sh.rm('-rf', `${deletePath}/.htaccess`)

  const sourceFile = upath.resolve(
    upath.dirname(__filename),
    '../src/php/.htaccess'
  )
  const destFile = upath.resolve(upath.dirname(__filename), '../dist/.htaccess')

  sh.cp('-R', sourceFile, destFile)
}
