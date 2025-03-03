DetailBar#details
{
    expanded:false
    {
        subset:attributes
        text:"${attributes}"
        icon-size:16
        icon:"icons/16/attributes.svg"
        layout:{
            type:VBoxLayout
            margin:8
        }
        GridLayout
        {
            column:6
            
            "${catalog}:" LineView{name:catalog}
            "${size}:" LineView{name:file_size,format:bytes}
            "${downloaded}:" LineView{name:downloaded,format:bytes}
            "${uploaded}:" LineView{name:uploaded,format:bytes}
            "${connectivity}:" LineView{name:connectivity}
            "${connect_timeout}:" LineView{name:connect_timeout,format:"number ms"}
            "${connections}:" LineView{name:connections}
            "${max_connections}:" LineView{name:max_connections}
            "${max_retry}:" LineView{name:max_retry}
            "${speed_limit_download}:" LineView{name:speed_limit_download,format:"number KB/s"}
            "${speed_limit_upload}:" LineView{name:speed_limit_upload,format:"number KB/s"}
            "${resumable}:" LineView{name:resumable}
            "${auto_rename_file}:" LineView{name:auto_rename_file}
            "${time_create}:" LineView{name:time_create,format:datetime}
            "${time_start}:" LineView{name:time_start,format:datetime}
            "${time_end}:" LineView{name:time_end,format:datetime}
        }
  
    }
    {
        subset:request
        text:"${request}"
        icon-size:16
        icon:"icons/16/request.svg"
        layout:VBoxLayout
        

        GridLayout
        {
            column:2
     
            "${proxy}:" LineView{name:proxy}
            
            "${address}:" LineEdit{
                name:uri
                readonly:true
            }
            "${message}" TextEdit{
                name:message
                readonly:true
            }
        }
   
    }
    {
        subset:connections
        text:"${connections}"
        icon-size:16
        icon:"icons/16/connect.svg"
        layout:{
            type:VBoxLayout
            margin:1
        }
        Table.table#connections
        {
            sortable:true
            stripe:true
            editable:false
            grid:false
            numbers:true
            selection:rows
            min-height:100
            columns:{
                {name:"transferred",width:180,text:"${transferred}",format:bytes}
                {name:"begin",width:120,text:"${begin}",format:bytes}
                {name:"end",width:120,text:"${end}",format:bytes}
                {name:"state",width:180,text:"${state}"}
            }
        }
    }
    {
        subset:blocks
        text:"${blocks}"
        icon-size:16
        icon:"icons/16/partials.svg"
        layout:{
            type:VBoxLayout
            margin:1
        }
        Blocks{
            min-height:120
            name:blocks
        }
    }
}
 
