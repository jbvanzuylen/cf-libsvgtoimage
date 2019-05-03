<cfcomponent displayname="Converter" output="false">
  <!---
    Generates a jog file with a svg file
    @return void
  ---->
  <cffunction name="convert" access="public" returntype="void" output="false">
    <cfargument name="svgFilePath" required="true" type="string" />
    <cfargument name="imageFilePath" required="true" type="string" />
    <cfargument name="scaleFactor" required="false" default="6" type="numeric" />
    <cfargument name="qualityFactor" required="false" default="1.0" type="numeric" />
    <cfargument name="imageType" required="false" type="string" default="jpg" />
    <cfargument name="imageWidth" required="true" type="numeric" />
    <cfargument name="imageHeight" required="true" type="numeric" />

    <!--- Define local variables --->
    <cfset var scaleImprovementFactor = arguments.scaleFactor />
    <cfset var qualityImprovementFactor = javacast("float", arguments.qualityFactor) />
    <cfset var transcoder = "" />
    <cfset var svgPath = "" />
    <cfset var input = "" />
    <cfset var stream = "" />
    <cfset var output = "" />

    <!--- Create transcoder --->
    <cfif arguments.imageType eq "jpg">
      <cfset transcoder = createObject("java", "org.apache.batik.transcoder.image.JPEGTranscoder").init() />
      <!--- settings for quality improvement --->
      <cfset transcoder.addTranscodingHint(transcoder.KEY_HEIGHT, javacast("float", arguments.imageHeight * scaleImprovementFactor)) />
      <cfset transcoder.addTranscodingHint(transcoder.KEY_WIDTH, javacast("float", arguments.imageWidth * scaleImprovementFactor)) />
      <cfset transcoder.addTranscodingHint(transcoder.KEY_QUALITY, qualityImprovementFactor) />
    <cfelseif arguments.imageType eq "pdf">
      <cfset transcoder = createObject("java", "org.primeoservices.cflibsvgtoimage.CustomPDFTranscoder").init() />
    <cfelse>
      <cfset transcoder = createObject("java", "org.apache.batik.transcoder.image.PNGTranscoder").init() />
    </cfif>

    <!--- Convert --->
    <cfset svgPath = createObject("java", "java.io.File").init(arguments.svgFilePath).toURL().toString() />
    <cfset input = createObject("java", "org.apache.batik.transcoder.TranscoderInput").init(svgPath) />
    <cfset stream = createObject("java", "java.io.FileOutputStream").init(arguments.imageFilePath) />
    <cfset output = createObject("java", "org.apache.batik.transcoder.TranscoderOutput").init(stream) />
    <cfset transcoder.transcode(input, output) />
    <cfset stream.flush() />
    <cfset stream.close() />
  </cffunction>
</cfcomponent>