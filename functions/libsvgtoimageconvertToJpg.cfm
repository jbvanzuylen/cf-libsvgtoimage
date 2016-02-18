<cffunction name="libsvgtoimageconvertToJpg" returntype="void" output="false">
  <cfargument name="svgFilePath" required="true" type="string" />
  <cfargument name="imageFilePath" required="true" type="string" />
  <cfargument name="scaleFactor" required="false" default="6" type="numeric" />
  <cfargument name="qualityFactor" required="false" default="1.0" type="numeric" />
  <cfargument name="imageWidth" required="true" type="numeric" />
  <cfargument name="imageHeight" required="true" type="numeric" />

  <!--- Convert the svg to jpg --->
  <cfreturn createObject("component", "libsvgtoimage.Converter").convert(argumentCollection = arguments) />
</cffunction>