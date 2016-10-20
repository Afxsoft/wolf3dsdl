/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   wolf3d.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aouloube <aouloube@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/10/19 12:54:05 by aouloube          #+#    #+#             */
/*   Updated: 2016/10/20 17:04:23 by aouloube         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include	"wolf3d.h"


int main( int argc, char **argv)
{
	SDL_Window	*window;
	SDL_Renderer *render;
	SDL_Texture *bitmapTex;
	SDL_Surface *bitmapSurface;
	bitmapSurface = NULL;
	bitmapTex = NULL;

	SDL_Init(SDL_INIT_VIDEO);
	window = SDL_CreateWindow("Wolf3D", 100, 100, 640, 480, 0);
	if (window == NULL)
	{
		printf("error\n");
		return (1);
	}
	render = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
	bitmapSurface = SDL_LoadBMP("img/Hello.bmp");
	bitmapTex = SDL_CreateTextureFromSurface(render, bitmapSurface);
	SDL_FreeSurface(bitmapSurface);
	while (1)
	{
		SDL_Event e;
		if (SDL_PollEvent(&e)){
			if (e.type == SDL_QUIT)
			{
				break;
			}
			/* Select the color for drawing. It is set to red here. */
        //SDL_SetRenderDrawColor(render, 255, 0, 0, 255);

        /* Clear the entire screen to our selected color. */
        SDL_RenderClear(render);
        SDL_RenderCopy(render, bitmapTex, NULL, NULL);
        /* Up until now everything was drawn behind the scenes.
           This will show the new, red contents of the window. */
        SDL_RenderPresent(render);

        /* Give us time to see the window. */
        SDL_Delay(5000);
		}
		SDL_DestroyTexture(bitmapTex);
		SDL_DestroyRenderer(render);
		SDL_DestroyWindow(window);
	}
	SDL_Quit();
	return (0);
}
