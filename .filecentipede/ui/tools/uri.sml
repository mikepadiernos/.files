#encode
{
    text:"${encode} / ${decode}"
    layout:VBoxLayout
    
    "${source}:" TextEdit#source{}
    "${encoded}:" TextEdit#encoded{}
    
    HBoxLayout
    {
        <==>
        Button{
            text:"${encode}"
            icon:"icons/16/lock.svg"
            click:$uri-encode(${#source},${#encoded})
        }
        Button{
            text:"${decode}"
            icon:"icons/16/unlock.svg"
            click:$uri-decode(${#encoded},${#source})
        }
    }
}

#generate
{
    text:"${generate}"
    layout:VBoxLayout
    
    "URI:" TextEdit{
        name:gen_uri
        placeholder:"${example}:
http://127.0.0.1/image*.jpg
http://127.0.0.2/video*.mp4
"
    }
    HBoxLayout
    {
        "${range}:"
        SpinBox#gen_from_num{
            name:gen_from
            value:0
            min:-999999999
            max:999999999
            
        }
        LineEdit#gen_from_al{
            name:gen_from_al
            value:A
            max-size:1
            visible:false
        }
        "-"
        SpinBox#gen_to_num{
            name:gen_to
            value:256
            min:-99999999
            max:99999999
            
        }
        LineEdit#gen_to_al{
            name:gen_to_al
            value:Z
            max-size:1
            visible:false
        }
        "${type}:" ComboBox#gen_type
        {
            name:gen_type
            vtype:index
            "${number}"
            "${alpha}"
        }
        
        <==>
        CheckBox{
            text:"${length}:"
            toggle:{
                $enable{#gen_length}(...)
                $enable{#gen_prefix}(...)
            }
        }
        SpinBox#gen_length{
            name:gen_length
            enable:false
            value:2
            min:0
            max:100
        }
        "${prefix}:" LineEdit#gen_prefix{
            name:gen_prefix
            enable:false
            value:0
            max-size:1
        }
        
    }
    "${result}:" TextEdit#gen_result{
        name:gen_result
    }


    HBoxLayout{
        Button#generate_copy{
            text:"${copy}"
            icon:"icons/16/copy.svg"
            click:$copy(${#gen_result})
        }
        <==>
        Button#generate_uri{
            text:"${generate}"
        }
    }
}


Dialog#main
{
    title:"${uri_tool}"
    layout:VBoxLayout
    w:660
    h:400
    
    Tab#tab{
        ${#encode}
        ${#generate}
    }
}
 
