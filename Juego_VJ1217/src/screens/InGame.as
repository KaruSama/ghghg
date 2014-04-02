package  
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Laura
	 */
	
	public class InGame extends Sprite
	{
		private var floor:Image;
		private var paredizq:Image;
		private var paredder:Image;
		private var chustafondo:Image;
		private var basketBall:Image;
		private var tennisBall:Image;
        private var physics:PhysInjector;
		private var bg:Image;
		private var voleyball:Image;
		
		
		public function InGame() 
		{
			super();
			PhysInjector.STARLING = true;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
						
			createSprites();
            injectPhysics();
			
			addEventListener(Event.ENTER_FRAME, onUpdate);
			trace("InGame screen initialized");
			
			
		}
		
		private function onUpdate(event:Event):void 
		{
			physics.update();
			
		}
		
		private function injectPhysics():void 
		{
						
			physics = new PhysInjector(Starling.current.nativeStage, new b2Vec2(0, 60), true);
            var floorObject:PhysicsObject = physics.injectPhysics(floor, 
				PhysInjector.SQUARE,
				new PhysicsProperties( {
				isDynamic:false, friction:0.5, restitution:0.5}));
            var tennisball:PhysicsObject = 
				physics.injectPhysics(tennisBall, 
				PhysInjector.CIRCLE, new PhysicsProperties
				( { isDynamic:true, friction:0.2, restitution:0.9 } ));
				
			var basketball:PhysicsObject = 
				physics.injectPhysics(basketBall, 
				PhysInjector.CIRCLE, new PhysicsProperties
				( { isDynamic:true, friction:0.2, restitution:0.9 } ));
			
			var paredderecha:PhysicsObject = physics.injectPhysics(paredizq,
				PhysInjector.SQUARE,
				new PhysicsProperties ( {
				isDynamic:false, friction: 0.5, restitution:0.5  } )); 
				//Faramir He estado probando otras propiedades fisicas como: linearVelocity:(1,2)
				//se supone que asi es como se marca el vector de fuerzas de salida de un objeto,
				//pero no chusca, cuando puedas echale un ojo.
			
			var paredizquierda:PhysicsObject = physics.injectPhysics(paredder,
				PhysInjector.SQUARE,
				new PhysicsProperties ( {
				isDynamic:false, friction: 0.5, restitution:0.5 } ));
				
			var voleyball:PhysicsObject = physics.injectPhysics(voleyball,
				PhysInjector.CIRCLE,
				new PhysicsProperties ( {
				isDinamic:false,isDraggable:false, friction: 1, restitution:1 } ));
				
		}
		
		private function createSprites():void 
		{
			chustafondo = new Image(Assets.getTexture("chustavolcan"));
			this.addChild(chustafondo);
			
						
			paredder = new Image (Assets.getTexture("paredmangui"));
			
			paredder.x = stage.stageWidth * 7 / 8;// 896;// stage.stageWidth;
            paredder.y = 0;// stage.stageHeight -100;
            this.addChild(paredder);
			
						
			paredizq = new Image (Assets.getTexture("paredmangui"));
			
			paredizq.x = stage.stageWidth / 8; //128;
            paredizq.y = 0; //stage.stageHeight - 100;
            this.addChild(paredizq);
			
			floor = new Image(Assets.getTexture("suelomangui"));
			
			
            floor.x = stage.stageWidth * 0.5 - floor.width * 0.5;
            floor.y = stage.stageHeight - floor.height - 50;
            this.addChild(floor);
            
			
            basketBall = new Image(Assets.getTexture("images"));
            
            basketBall.x = stage.stageWidth * 0.5 - basketBall.width * 0.6;
            basketBall.y = 10;
            this.addChild(basketBall);
			
			tennisBall = new Image(Assets.getTexture("tenis"));
            
            tennisBall.x = stage.stageWidth * 0.5 - tennisBall.width * 0.45;
            tennisBall.y = 300;
            this.addChild(tennisBall);
			
			voleyball = new Image(Assets.getTexture("voleyball"));
			
			voleyball.x = stage.stageWidth * 0.5 - tennisBall.width * 0.45;
			voleyball.y = 200;
			this.addChild(voleyball);
			
			
		}
		
		public function initialize():void
		{
			this.visible = true;
			
			
		}
				
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			
		}
		
				
		
		
	}

}

}