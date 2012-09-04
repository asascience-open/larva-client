package com.classes
{
	import com.esri.ags.utils.DateUtil;
	
	import mx.collections.ArrayCollection;
	import mx.formatters.DateFormatter;

	public class behavior
	{
		public function behavior()
		{
			
		}
		
		//change values for Behavior Created Date JSON
		public static function convertTimeObject(object:Object):Object
		{
			var newObj:ArrayCollection = new ArrayCollection();
			
			var df:DateFormatter = new DateFormatter;
			df.formatString = "MMM DD YYYY at HH:NN A";
			for each (var behavior:Object in object)
			{
				var beh:Date = new Date(behavior.created);
				behavior.created = df.format(beh);
				newObj.addItem(behavior);
			}
			return newObj;
		}
		
		//change values for Currents Date fields JSON
		public static function convertTimeObjectCurrents(object:Object):Object
		{
			var newObj:ArrayCollection = new ArrayCollection();
			
			var df:DateFormatter = new DateFormatter;
			df.formatString = "MMM DD YYYY at HH:NN A";
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