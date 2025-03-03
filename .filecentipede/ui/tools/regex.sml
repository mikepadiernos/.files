
Dialog#main
{
    title:"${regex}"
    layout:VBoxLayout
    w:400
    h:200
    
    LineEdit#regex{
        placeholder:"${regex}"
    }
    TextEdit#text{
        placeholder:"${text}"
    }
    
    HBoxLayout
    {
        "${result}: " Label#result{css:"font-weight:bold"}
        
        <==>
        Button{
            text:"${match}"
            click:$text{#result}($regex-match(${#regex},${#text}))
        }
        Button{
            text:"${search}"
            click:$text{#result}($regex-search(${#regex},${#text}))
        }
    }
}
 
 
