const execa = require('execa');
const ora = require('ora');

run();

async function run() {
  const spiner = ora().start();

  spiner.text = 'Getting installed extensions...';
  const { stdout } = await execa('code', ['--list-extensions']);
  const installedExtensions = new Set(stdout.split('\n'));
  spiner.succeed();

  spiner.text = 'Get extensions in config...';
  const extensions = new Set(require('../config.json').vscodeExtensions);
  spiner.succeed();

  // get extensions need to be added to config
  const extensionsNeedToBeAdded = new Set();
  for (const ext of installedExtensions) {
    if (!extensions.has(ext)) {
      extensionsNeedToBeAdded.add(ext);
    }
  }

  // get extesions need to be installed
  const extensionsNeedToBeInstalled = new Set();
  for (const ext of extensions) {
    if (!installedExtensions.has(ext)) {
      extensionsNeedToBeInstalled.add(ext);
    }
  }

  console.log(`New extensions has been added to the configuration file:\n`);
  for (const ext of extensionsNeedToBeAdded) {
    console.log('    ', ext);
  }

  console.log(`Extensions has been installed:\n`);
  for (const ext of extensionsNeedToBeInstalled) {
    console.log('    ', ext);
  }
}
