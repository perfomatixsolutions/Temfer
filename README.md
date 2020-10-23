# Temfer!

Hi! this is **Temfer** :) . I'm a flutter based weather App for reference and showcase the flutter App building capabilities of the organization.


## APIs

This app uses the  **OpenWeatherAPI!** 
  >https://openweathermap.org/api
 

## Flutter Libraries

      Liquid_pull_to_refresh 2.0.0
   >https://pub.dev/packages/liquid_pull_to_refresh
   
  #### Usage: 
         
         LiquidPullToRefresh(
                    key: _refreshIndicatorKey,	// key if you want to add
                    onRefresh: _handleRefresh,	// refresh callback
                      child: ListView(),		// scroll view
                    );
         NB: If you are not using ListView() as the child wrap the child widget in a SingleChildScrollView()
