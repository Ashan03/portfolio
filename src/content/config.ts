import { defineCollection, z } from 'astro:content';

const projects = defineCollection({
	type: 'content',
	schema: z.object({
		title: z.string(),
		description: z.string(),
		course: z.string().optional(),
		year: z.string().optional(),
		advisor: z.string().optional(),
		team: z.string().optional(),
		category: z.string().optional(), // 'thinking', 'embodied', 'spatial', 'strategy'
		heroImage: z.string().optional(),
		order: z.number().optional().default(0),
		tags: z.array(z.string()).optional(),
	}),
});

export const collections = { projects };
