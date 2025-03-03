Dialog#main
{
    title:"HTTP Raw"
    layout:VBoxLayout
    w:600
    h:300
    
    TextEdit#text
    {
        placeholder:"${example}:
        
GET http://127.0.0.1/1.zip HTTP/1.1
Host: 127.0.0.1
User-Agent: Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko
Referer: http://127.0.0.1
Cookie: _octo=GH1.1.1607739480.1646658916

"
    }
    HBoxLayout
    {
        <==>
        Button{
            text:"${cancel}"
            click:$close{#main}()
        }
        Button#ok{
            text:"${OK}"
        }
    }
}
