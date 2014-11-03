import mari, PythonQt
import sys, os

os.chdir('..')
PATH = os.path.abspath(os.curdir)

mari.gl_render.registerCustomHeaderFile("DI_ADJUSTMENT_UTILS_GLSLH", "%s\\Shaders\\adjustment\\lib\\diMari_adjUtils.glslh" %(PATH))
mari.gl_render.registerCustomCodeFile("DI_ADJUSTMENT_UTILS_GLSLC", "%s\\Shaders\\adjustment\\lib\\diMari_adjUtils.glslc" %(PATH))

mari.gl_render.registerCustomAdjustmentLayerFromXMLFile("*di* custom/normalize", "%s\\Shaders\\adjustment\\diMariNormalize.xml" %(PATH))
mari.gl_render.registerCustomAdjustmentLayerFromXMLFile("*di* custom/saturation", "%s\\Shaders\\adjustment\\diMariSaturation.xml" %(PATH))
