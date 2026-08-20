const vscode = require('vscode');

function activate(context) {
  const disposable = vscode.commands.registerCommand('mikepadiernos.lazydockerEditor.openLazydocker', async function () {
    for (const openTerminal of vscode.window.terminals) {
      if (openTerminal.name === 'lazydocker' && !openTerminal.exitStatus) {
        openTerminal.show(true);
        await vscode.commands.executeCommand('workbench.action.terminal.moveToEditor');
        await vscode.commands.executeCommand('workbench.action.focusActiveEditorGroup');
        return;
      }
    }

    const terminal = vscode.window.createTerminal({ name: 'lazydocker' });
    terminal.sendText('lazydocker; exit', true);
    terminal.show(true);
    await vscode.commands.executeCommand('workbench.action.terminal.moveToEditor');
    await vscode.commands.executeCommand('workbench.action.focusActiveEditorGroup');
  });

  context.subscriptions.push(disposable);
}

function deactivate() {}

module.exports = {
  activate,
  deactivate
};
