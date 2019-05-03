package org.primeoservices.cflibsvgtoimage;

import org.apache.fop.svg.PDFTranscoder;
import org.apache.fop.svg.font.FOPFontFamilyResolver;

public class CustomPDFTranscoder extends PDFTranscoder
{
  @Override
  protected FOPTranscoderUserAgent createUserAgent()
  {
    return new CustomFOPTranscoderUserAgent();
  }

  /**
   * Custom user agent implementation to override the font family resolver
   */
  private class CustomFOPTranscoderUserAgent extends FOPTranscoderUserAgent
  {
    @Override
    public void setFontFamilyResolver(final FOPFontFamilyResolver resolver)
    {
      super.setFontFamilyResolver(new CustomFOPFontFamilyResolver(resolver));
    }
  }
}
