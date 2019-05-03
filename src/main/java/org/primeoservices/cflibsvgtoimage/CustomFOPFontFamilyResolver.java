package org.primeoservices.cflibsvgtoimage;

import java.awt.Font;
import java.io.InputStream;

import org.apache.batik.bridge.FontFace;
import org.apache.batik.gvt.font.AWTFontFamily;
import org.apache.batik.gvt.font.GVTFontFamily;
import org.apache.fop.svg.font.FOPFontFamilyResolver;
import org.apache.fop.svg.font.FOPFontFamilyResolverImpl;
import org.apache.fop.svg.font.FOPGVTFontFamily;

/**
 * Custom font family resolver that implements the {@link #loadFont(InputStream, FontFace)} method
 * 
 * @see FOPFontFamilyResolverImpl#loadFont(InputStream, FontFace)
 */
public class CustomFOPFontFamilyResolver implements FOPFontFamilyResolver
{
  private FOPFontFamilyResolver resolver;

  /**
   * @param resolver
   */
  public CustomFOPFontFamilyResolver(final FOPFontFamilyResolver resolver)
  {
    this.resolver = resolver;
  }

  public FOPGVTFontFamily resolve(final String familyName)
  {
    return this.resolve(familyName);
  }

  public GVTFontFamily resolve(final String familyName, final FontFace fontFace)
  {
    return this.resolver.resolve(familyName, fontFace);
  }

  public GVTFontFamily loadFont(final InputStream in, final FontFace fontFace) throws Exception
  {
    final Font font = Font.createFont(Font.TRUETYPE_FONT, in);
    return new AWTFontFamily(fontFace, font);
  }

  public FOPGVTFontFamily getDefault()
  {
    return this.resolver.getDefault();
  }

  public FOPGVTFontFamily getFamilyThatCanDisplay(final char c)
  {
    return this.resolver.getFamilyThatCanDisplay(c);
  }
}
