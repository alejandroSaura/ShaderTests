﻿Shader "Cg shader using additive blending" {

   Properties
   {
   		_Color ("color", Color) = (0.0, 1.0, 0.0, 1.0)  
   }

   SubShader {
      Tags { "Queue" = "Transparent" } 
         // draw after all opaque geometry has been drawn
      Pass { 
         Cull Off // draw front and back faces
         ZWrite Off // don't write to depth buffer 
            // in order not to occlude other objects
         Blend SrcAlpha One // additive blending

         CGPROGRAM 
 
         #pragma vertex vert 
         #pragma fragment frag
         
         float4 _Color;
 
         float4 vert(float4 vertexPos : POSITION) : SV_POSITION 
         {
            return mul(UNITY_MATRIX_MVP, vertexPos);
         }
 
         float4 frag(void) : COLOR 
         {
            return _Color; 
         }
 
         ENDCG  
      }
   }
}