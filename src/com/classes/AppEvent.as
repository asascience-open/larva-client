///////////////////////////////////////////////////////////////////////////
//Main Class to Pass around Data and Events
///////////////////////////////////////////////////////////////////////////
package com.classes
{
	import com.classes.EventBus;
	
	import flash.events.Event;
	
	import mx.messaging.messages.ErrorMessage;
	
	/**
	 * AppEvent is used within the application to send messages among components
	 */
	public class AppEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		public static const SET_APP_PROGRESS_ON:String = "progressOn";
		public static const SET_APP_PROGRESS_OFF:String = "progressOff";
		
		public static const EXIT_APP:String = "exitMap";
		
		/**
		 * The error event type. This event type is used to send a user friendly
		 * error message via the event bus. A error window will display the error
		 * message.
		 *
		 * <p>When sending the error message, the data sent with the AppEvent is the
		 * error string. For example: </p>
		 *
		 * <listing>
		 * AppEvent.dispatch(AppEvent.APP_ERROR, "An Error Message"));
		 * </listing>
		 *
		 * @see components.ErrorWindow
		 */
		public static const APP_ERROR:String = "appError";
		
		public static const APP_CHANGE_TAB:String = "appTab";
		
		/**
		 * This event type indicates that the Flex Viewer application has completed loading the
		 * configuration file. The ConfigManager sends this event so that other components that
		 * are interested in obtaining configuration data can listen to this event.
		 *
		 * @see ConfigManager
		 */
		public static const MAP_LOADED:String = "mapLoaded";
		
		public static const MAP_RESIZE:String = "mapResize";
		
		public static const MAP_LAYER_VISIBLE:String = "mapLayerVisibleChange";
		
		/**
		 * This event type indicates a dynamic layer is loaded.
		 */
		public static const LAYER_LOADED:String = "layerLoaded";
		
		//public static const LAYER_VISIBLE_CHANGED:String   = "layerVisibilityChanged";
		/**
		 * This event type is used by the Controller to indicate the base map has changed.
		 *
		 * @see Controller
		 */
		
		/**
		 * This event type is used by either Flex Viewer components or a widget to
		 * request set the map naviation method. The map navigation method could be
		 * pan, zoomin, zoomout, etc.
		 *
		 * <p>The navigation methods supported are:</p>
		 * <listing>
		 * pan          (Navigation.PAN)
		 * zoomin       (Navigation.ZOOM_IN)
		 * zoomout      (Navigation.ZOOM_OUT)
		 * zoomfull     (ViewerContainer.NAVIGATION_ZOOM_FULL)
		 * zoomprevious (ViewerContainer.NAVIGATION_ZOOM_PREVIOUS)
		 * zoomnext     (ViewerContainer.NAVIGATION_ZOOM_NEXT)
		 * </listing>
		 *
		 * <p>The navigation request can be sent as such:</p>
		 * <listing>
		 *  var data:Object =
		 *     {
		 *       tool: Navigation.PAN,
		 *       status: status
		 *      }
		 *   AppEvent.dispatch(AppEvent.SET_MAP_NAVIGATION, false, false, data));
		 * </listing>
		 *
		 */
		public static const SET_MAP_NAVIGATION:String = "setMapNavigation";
		
		/**
		 * This event type is used to set the status text shown at the controller bar. to AppEvent
		 * to set the status string, for example:
		 *
		 * <listing>
		 *  dispatchEvent(new AppEvent(AppEvent.SET_STATUS, false, false, status));
		 * </listing>
		 */
		public static const SET_STATUS:String = "setStatus";
		
		/**
		 * Used to show the info windows on the map through the AppEvent via EventBus.
		 *
		 * <listing>
		 *  AppEvent.dispatch(AppEvent.SHOW_INFOWINDOW, infoData);
		 * </listing>
		 *
		 * The infoData is a dynamic object structure as, for example:
		 * <listing>
		 *   var infoData:Object =
		 *       {
		 *          icon: icon,              //a Image object
		 *          title: "a title string",
		 *          content: "a string",
		 *          link: "http://a.url.com",
		 *          point: point,            //a Point object
		 *          geometry: geom           //a Geometry object
		 *       };
		 * </listing>
		 */
		public static const SHOW_INFOWINDOW:String = "widgetShowInfo";
		
		/**
		 * Used to set map's interactive mode, such as Draw point, line, etc. To
		 * use AppEvent via EventBus:
		 *
		 * <listing>
		 * AppEvent.dispatch(AppEvent.SET_MAP_ACTION, data));
		 * </listing>
		 *
		 * Where data is a dynamic data structure:
		 *
		 * <listing>
		 * var data:Object =
		 *   {
		 *       tool: action,       //an action string token
		 *       status: "status string",
		 *       handler: callback   //a callback Function
		 *   }
		 * </listing>
		 * Please refer to the Developer's Guide for details.
		 */
		public static const SET_MAP_ACTION:String = "setMapAction";
		
		public static const SET_APP_STATUS:String = "setAppAction";
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function AppEvent(type:String, data:Object = null, callback:Function = null)
		{
			super(type);
			_data = data;
			_callback = callback;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		private var _data:Object;
		
		private var _callback:Function;
		
		/**
		 * The data will be passed via the event. It allows the event dispatcher to publish
		 * data to event listener(s).
		 */
		public function get data():Object
		{
			return _data;
		}
		
		/**
		 * @private
		 */
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		/**
		 * The callback function associated with this event.
		 */
		public function get callback():Function
		{
			return _callback;
		}
		
		/**
		 * @private
		 */
		public function set callback(value:Function):void
		{
			_callback = value;
		}
		
		/**
		 * Override clone
		 */
		public override function clone():Event
		{
			return new AppEvent(this.type, this.data, this.callback);
		}
		
		/**
		 * Dispatch this event.
		 */
		public function dispatch():Boolean
		{
			return EventBus.instance.dispatchEvent(this);
		}
		
		/**
		 * Dispatch an AppEvent for specified type and with optional data and callback reference.
		 */
		public static function dispatch(type:String, data:Object = null, callback:Function = null):Boolean
		{
			return EventBus.instance.dispatchEvent(new AppEvent(type, data, callback));
		}
		
		public static function addListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			EventBus.instance.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public static function removeListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			EventBus.instance.removeEventListener(type, listener, useCapture);
		}
		
		public static function setStatus(status:String):void
		{
			dispatch(AppEvent.SET_STATUS, status);
		}
		
		public static function showError(content:String, title:String):void
		{
			//var errorMessage:ErrorMessage = new ErrorMessage(content, title);
			var errorMessage:ErrorMessage = new ErrorMessage();
			errorMessage.body = content;
			dispatch(AppEvent.APP_ERROR, errorMessage);
		}
	}
}
