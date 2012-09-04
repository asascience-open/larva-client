package com.classes
{
	import mx.collections.ArrayCollection;

	public class BehaviorClass extends Object
	{
		public function BehaviorClass()
		{
			super();
		}
		
		public function createBehavior(obj:Object):Object
		{
			
		}
		
		public var status:String = "";
		public var id:String= "";
		public var name:String = "";
		public var created:String = "";
		public var geometry:String = "";
		public var geo_keywords:Array = [];
		public var keywords:Array = [];
		public var user:String = "";
		public var common_name:String = "";
		public var genus:String = "";
		public var notes:String = "";
		public var species:String = "";
		public var lifeStages:ArrayCollection = {};
	}
}