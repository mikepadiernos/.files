Dialog#main
{
    title:"${troubleshooting}"
    layout:VBoxLayout
    
    Tab
    {
        {
            text:"${info}"
            layout:VBoxLayout
            
            GroupBox
            {
                title:"${troubleshooting}"
                layout:VBoxLayout
                
                Edit{
                    viewonly:true
                    value:"${troubleshooting_content_}"
                }
            }
            GroupBox
            {
                title:"${address}"
                layout:VBoxLayout
                A{"http://www.filecxx.com/troubleshooting.html"}
            }
        }
        {
            text:"${status}"
            layout:VBoxLayout

            GridLayout
            {
                column:2

                "HeartBeat:" LineView#heartbeat{}
    
                "Invalid message sent:" LineView#invalid_messages_sent{}
                "IPC connection:" LineView#ipc_connection{}
                "RPC connection:" LineView#rpc_connection{}
                
                "IPC read range begin:" LineView#ipc_read_range_begin{}
                "IPC read range end:" LineView#ipc_read_range_end{}
                "IPC write range begin:" LineView#ipc_write_range_begin{}
                "IPC write range end:" LineView#ipc_write_range_end{}
                "IPC overflowed size:" LineView#ipc_overflowed_size{}
                "IPC state:" LineView#ipc_state{}
                "IPC thread timestamp:" LineView#ipc_thread_timestamp{}
                
         
            }
            CheckBox#random_packets_test{
                text:"Random packets test"
            }
            <==>
        }
    }
  
    
    
}
 
 
