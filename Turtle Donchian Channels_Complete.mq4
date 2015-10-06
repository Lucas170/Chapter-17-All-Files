//+------------------------------------------------------------------+
//|                                     Turtle Donchian Channels.mq4 
//|                                     Copyright © 2015, Lucas Liew 
//|                                 http://blackalgotechnologies.com 
//+------------------------------------------------------------------+
#property copyright "Copyright © 2015, Lucas Liew"
#property link      "http://blackalgotechnologies.com"

// TDL 1: Set up Property Area

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 Orange
#property indicator_color2 Orange

// TDL 2: Declare buffers and variables

extern int  Periods = 10;
extern int  MaxBars = 200;
     
double ExtMapBuffer1[];
double ExtMapBuffer2[];
double turtleMax, turtleMin;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
// TDL 3: Set up buffers

   SetIndexStyle(0,DRAW_LINE,1,2);
   SetIndexBuffer(0,ExtMapBuffer1);
   SetIndexStyle(1,DRAW_LINE,1,2);
   SetIndexBuffer(1,ExtMapBuffer2);

//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custor indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
  {
//---- 
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
{

/* 
   TDL 4:   Calculate and Assign Values to the your buffers. (Difficulty Level: Intermediate)
   Hint:    Finding the Highs and Low of the last X bars requires higher computational capacity. 
            Hence, just draw the indicator for the latest 200 bars (index 0 to 199) to reduce computational time.
*/ 

   turtleMax = 0; // Refreshes the indicator value every bar
   turtleMin = 0; // Refreshes the indicator value every bar

   for (int shift = 0; shift < MaxBars; shift++) { // Start with latest bar, and work backwards
   
      turtleMax = High[iHighest(NULL,0,MODE_HIGH,Periods,shift+1)]; // High[] returns the high of a certain bar. iHighest returns the index number of the bar with a certain highest value. 
      turtleMin = Low[iLowest(NULL,0,MODE_LOW,Periods,shift+1)]; // Low[] returns the high of a certain bar. iLowest returns the index number of the bar with a certain lowest value.

      ExtMapBuffer1[shift] = turtleMin;
      ExtMapBuffer2[shift] = turtleMax;
	  
   }
   
   return(0);
   
  }
//+------------------------------------------------------------------+