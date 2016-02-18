<cffunction name="libsvgtoimageconvertToPng" returntype="void" output="false">
  <cfargument name="svgFilePath" required="true" type="string" />
  <cfargument name="imageFilePath" required="true" type="string" />
  <cfargument name="scaleFactor" required="false" default="6" type="numeric" />
  <cfargument name="qualityFactor" required="false" default="1.0" type="numeric" />
  <cfargument name="imageWidth" required="true" type="numeric" />
  <cfargument name="imageHeight" required="true" type="numeric" />

  <!--- define local variables --->
  <cfset var args = arguments />
  <cfset args["imageType"] = "png" />

  <!--- Convert the svg to png --->
  <cfreturn createObject("component", "libsvgtoimage.Converter").convert(argumentCollection = args) />
</cffunction>