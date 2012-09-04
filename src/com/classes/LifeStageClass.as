package com.classes
{
	import mx.collections.ArrayCollection;

	public class LifeStageClass extends Object
	{
		public function LifeStageClass()
		{
			super();
		}
		
		public function createLifeStage(obj:Object):Object
		{
			return obj;
		}
		
		public var name:String = "";
		public var linear_b:String = "";
		public var notes:String = "";
		public var linear_a:String = "";
		public var capability:Object = [];
		public var duration:Number = 0;
		public var diel:ArrayCollection = new ArrayCollection(); 
		public var taxis:ArrayCollection = new ArrayCollection(); 
		
	}
}