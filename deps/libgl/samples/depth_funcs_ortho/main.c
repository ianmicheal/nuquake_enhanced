#ifdef __DREAMCAST__
#include <kos.h>
#endif

#include "GL/gl.h"
#include "GL/glu.h"
#include "GL/glkos.h"

/* A general OpenGL initialization function.  Sets all of the initial parameters. */
void InitGL(int Width, int Height)	        // We call this right after our OpenGL window is created.
{
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);		// This Will Clear The Background Color To Black
    glClearDepth(1.0);				// Enables Clearing Of The Depth Buffer
    glDepthFunc(GL_LEQUAL);				// The Type Of Depth Test To Do
    glEnable(GL_DEPTH_TEST);			// Enables Depth Testing
    glShadeModel(GL_SMOOTH);			// Enables Smooth Color Shading

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();				// Reset The Projection Matrix
    glOrtho(0.0, 640.0, 0.0, 480.0, 0.0, 1.0);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

/* The function called when our window is resized (which shouldn't happen, because we're fullscreen) */
void ReSizeGLScene(int Width, int Height)
{
    if (Height == 0)				// Prevent A Divide By Zero If The Window Is Too Small
        Height = 1;

    glViewport(0, 0, Width, Height);		// Reset The Current Viewport And Perspective Transformation

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    glOrtho(0.0, 640.0, 0.0, 480.0, 0.0, 1.0);

    glMatrixMode(GL_MODELVIEW);
}


void DrawSquare(float width, float r, float g, float b, float z) {
    width /= 2;

    glColor3f(r, g, b);
    glBegin(GL_QUADS);				// start drawing a polygon (4 sided)
    glVertex3f(-width, width, z);		// Top Left
    glVertex3f( width, width, z);		// Top Right
    glVertex3f( width,-width, z);		// Bottom Right
    glVertex3f(-width,-width, z);		// Bottom Left
    glEnd();					// done with the polygon
}

int check_start() {
#ifdef __DREAMCAST__
    maple_device_t *cont;
    cont_state_t *state;

    cont = maple_enum_type(0, MAPLE_FUNC_CONTROLLER);

    if(cont) {
        state = (cont_state_t *)maple_dev_status(cont);

        if(state)
            return state->buttons & CONT_START;
    }
#endif

    return 0;
}

/* The main drawing function. */
void DrawGLScene()
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);		// Clear The Screen And The Depth Buffer
    glLoadIdentity();				// Reset The View

    // Center fo the screen.
    glTranslatef(320, 240, 0);

    glDepthFunc(GL_LEQUAL);
    //RED over GREEN over BLUE
    DrawSquare(100.0, 1.0, 0.0, 0.0, 0.0);
    glTranslatef(50, 0, -0.03f);
    DrawSquare(100, 0, 1, 0, 0);
    glTranslatef(50, 0, -0.03f);
    DrawSquare(100, 0, 0, 1, 0);

    // swap buffers to display, since we're double buffered.
    glKosSwapBuffers();
}

int main(int argc, char **argv)
{
    glKosInit();

    InitGL(640, 480);
    ReSizeGLScene(640, 480);

    while(1) {
        if(check_start())
            break;

        DrawGLScene();
    }

    return 0;
}
