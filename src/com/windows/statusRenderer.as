package com.windows{
	
	import mx.controls.Label;
	import mx.controls.dataGridClasses.*;
	
	public class statusRenderer extends Label {
		
		override public function set data(value:Object):void
		{
			if(value != null)
			{
				super.data = value;
				if(value[DataGridListData(listData).dataField] == "SUCCESS") {
					setStyle("color", 0x009933);
				}
				else if(value[DataGridListData(listData).dataField] == "PENDING") {
					setStyle("color", 0xFF0066);
				}
				else if(value[DataGridListData(listData).dataField] == "STARTED") {
					setStyle("color", 0x3333CC);
				}
				else {
					//#FF0000 red 
					setStyle("color", 0xFF0000);
				}
			}
		}
	}
	
}