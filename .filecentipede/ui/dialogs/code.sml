Dialog#main
{
    title:"${software_name_} - ${activation_code}"
    layout:VBoxLayout
    w:600
    h:400
    
    HBoxLayout
    {
        "UID:" LineEdit#uid{
            name:uid
            readonly:true
        }
        ToolButton{
            icon:"icons/16/copy.svg"
            click:$copy(${#uid})
        }
    }
    TextEdit
    {
        name:code
        placeholder:"${activation_placeholder}"
    }
    GroupBox
    {
        title:"${info}"
        layout:{
            type:GridLayout
            column:2
        }
        "${time_install}: " LineView{name:time_install,format:datetime}
        "${time_activated}: " LineView{name:time_activated,format:datetime}
        "${time_expire}: " LineView{name:time_expire,format:datetime}
        "GitHub: " A{"https://github.com/filecxx/FileCentipede"}
        "${get_it_free}: " A#addr{"http://filecxx.com/activation_code.html"}
    }
  
    HBoxLayout
    {
        Button#get{
            text:"${get_it_free}"
        }
        <==>
        Button#later{
            text:"${activate_later}"
        }
        Button#ok{
            text:"${OK}"
        }
    }
}
