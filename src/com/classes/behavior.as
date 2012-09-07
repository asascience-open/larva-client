package com.classes
{
	import com.esri.ags.utils.DateUtil;
	
	import mx.collections.ArrayCollection;
	import mx.controls.DateField;
	import mx.formatters.DateFormatter;

	public class behavior
	{
		public function behavior()
		{
			
		}
		
		//change Date for Behavior Created Date JSON from EPOC to readable
		public static function convertTimeObject(object:Object):Object
		{
			var newObj:ArrayCollection = new ArrayCollection();
			
			var df:DateFormatter = new DateFormatter;
			df.formatString = "MM/DD/YYYY at HH:NN";
			for each (var behavior:Object in object)
			{
				var beh:Date = new Date(behavior.created);
				behavior.created = df.format(beh);
				newObj.addItem(behavior);
			}
			return newObj;
		}
		
		//change Date for Behavior Created Date JSON from readable to EPOC
		public static function convertTimeObjectEPOC(object:Object):Object
		{
			var newObj:ArrayCollection = new ArrayCollection();
			
			for each (var behavior:Object in object)
			{
				//check if already a number
				if(String(behavior.created).search("at")>-1){
					var items:Array = String(behavior.created).split(" at ");
					var dateElements:Array = items[0].split("/");
					var timeElements:Array = items[1].split(":");
					
					var n:Date = new Date(dateElements[2],dateElements[0],dateElements[1],timeElements[0],timeElements[1]);
					behavior.created = n.time;
				}
				newObj.addItem(behavior);
			}
			return newObj;
		}
		
		//change values for Currents Date fields JSON
		public static function convertTimeObjectCurrents(object:Object):Object
		{
			var newObj:ArrayCollection = new ArrayCollection();
			
			var df:DateFormatter = new DateFormatter;
			df.formatString = "MM/DD/YYYY at HH:NN";
			for each (var currentObj:Object in object)
			{
				var startD:Date = new Date(currentObj.starting);
				currentObj.starting = df.format(startD);
				var endD:Date = new Date(currentObj.ending);
				currentObj.ending = df.format(endD);
				var updateD:Date = new Date(currentObj.updated);
				currentObj.updated = df.format(updateD);
				newObj.addItem(currentObj);
			}
			return newObj;
		}
	}
}