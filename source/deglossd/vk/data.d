module deglossd.vk.data;
import erupted;
// Most of this code is based of the VulkanSamples overlay sample for now.

enum GlyphCount = 96;

struct ImageData {
	VkImage image;
	VkImageView imageView;
	VkFramebuffer framebuffer;
	VkCommandBuffer cmdbuffer;
	
	// Vertex Buffer
	VkBuffer vertex;
	VkDeviceMemory vertexBufferMem;
	int vertexCount;
	VkDeviceSize vertexBufferSize;
}

struct SwapchainData {
	uint width, height;
	VkFormat format;

	VkRenderPass renderPass;
	VkPipeline pipeline;

	ImageData*[] presentableImages;

	void cleanup(VkDevice device) {
		// TODO: Implement.
	}
}

struct LayerData {
	VkLayerDispatchTable* dispatchTable;
	VkLayerInstanceDispatchTable* instanceDispatchTable;
	
	PFN_vkCreateSwapchainKHR pfnCreateSwapchainKHR;
	PFN_vkGetSwapchainImagesKHR pfnGetSwapchainImagesKHR;
	PFN_vkQueuePresentKHR pfnQueuePresentKHR;
	PFN_vkDestroySwapchainKHR pfnDestroySwapchainKHR;

	VkPhysicalDevice gpu;
	VkDevice device;
	size_t familyIndex;

	PFN_vkSetDeviceLoaderData pfnDevInit;
	SwapchainData*[VkSwapchainKHR]* swapChains;
	VkCommandPool pool;

	VkPipelineCache pipeline;

	VkShaderModule vertShader;
	VkShaderModule fragShader;

	VkImage fontGlyphTexture;
	VkImageView fontGlyphImageView;
	VkDeviceMemory fontGlypthDeviceMem;
	FT_Glyph[GlyphCount] glyphs;
	VkCommandBuffer fontUploadBuffer;
	bool fontUploaded = false;

	VkDescriptorSetLayout descriptorSetLayout;
	VkPipelineLayout pipelineLayout;
	VkDescriptorPool descriptorPool;
	VkDescriptorSet descriptorSet;
	VkSampler sampler;
	VkFence fence;

	int frame;
	int cmdBuffersThisFrame;

	

	void cleanup() {

	}
}
