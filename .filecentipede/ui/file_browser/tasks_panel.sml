Action#act_delete
{
    text:"${delete}"
    icon:"icons/16/delete_all.svg"
}

Action#act_delete_all
{
    text:"${delete_all}"
    icon:"icons/16/delete_all.svg"
}


Widget#main
{
    text:"${file_transfer}"
    layout:VBoxLayout
    
    Table
    {
        sortable:true
        editable:false
        wordwrap:false
        stripe:true
        stretch:expand
        stretch-last-section:true
        selection:rows
        columns-height:26
        columns:{
            {name:type,text:"${type}",width:80}
            {name:state,text:"${state}",width:100}
            {name:time_start,text:"${time_start}",width:130,format:datetime,sort:desc}
            {name:remote_path,text:"${remote_path}",width:240}
            {name:parameter,text:"${parameter}",width:100}
        
        }
        context-menu:{
     
            ---
            ${#act_delete}
            ${#act_delete_all}
        }
    }
} 
