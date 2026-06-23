def bind(config, keepassxc_script=None, keepassxc_gpg_key=""):
    config.bind("<Ctrl-r>", ":reload")
    config.bind("<Ctrl-Shift-Left>", ":tab-prev")
    config.bind("<Ctrl-Shift-Right>", ":tab-next")
    config.bind("<Ctrl-Shift-Del>", ":tab-close")

    if keepassxc_script:
        keepassxc_key_args = f"--key {keepassxc_gpg_key}" if keepassxc_gpg_key else "--insecure"
        fill_cmd = f"spawn --userscript {keepassxc_script} {keepassxc_key_args}"
        totp_cmd = f"spawn --userscript {keepassxc_script} {keepassxc_key_args} --totp"

        config.bind("pw", fill_cmd, mode="normal")
        config.bind("pt", totp_cmd, mode="normal")
        config.bind("<Alt-Shift-u>", fill_cmd, mode="insert")
