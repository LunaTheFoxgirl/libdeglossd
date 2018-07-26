module deglossd.glyphs;
import derelict.freetype.ft;

struct GlyphSet {
	public FT_Glyph[] glyphs;
	
	this(string file) {
		// TODO: Load glyph
	}

	void prepareGlyphs() {

		// Convert glyphs from vectors to bitmaps (just in case.)
		foreach(i; 0 .. glyphs.length) {
			if (glyphs[i] != null) {
				if (glyphs[i].format != FT_GLYPH_FORMAT_BITMAP) {
					FT_Vector origin = FT_Vector(0, 0);
					FT_Glyph_To_Bitmap(&glyphs[i], FT_RENDER_MODE_NORMAL, &origin, 1);
				}
			}
		}
	}
}
