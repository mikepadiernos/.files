InputDialog#uninstall_confirm_input
{
    mode:text
    title:"${uninstall}"
    label:"${operation_confirm_input_}"
}


Dialog#main
{
    title:"${uninstall}"
    layout:VBoxLayout
    min-width:500

    HBoxLayout
    {
        "${path}: " LineView#path{
            
        }
    }
    Label{
        wordwrap:true
        value:"${uninstall_notice_}"
        css:"color:gray"
    }
    Label{
        wordwrap:true
        value:"${uninstall_notice2_}<br/><br/>"
        css:"color:gray"
    }
    HBoxLayout
    {
        <==>
        Button{
            icon-size:16
            icon:"icons/16/directory.svg"
            text:"${open_directory}"
            click:$open-url(${#path})
        }
        Button#btn_uninstall{
            icon:"icons/16/delete_all.svg"
            text:"${uninstall}"
        }
        Button{
            text:"${cancel}"
            click:$close{#main}()
        }
    }
}
