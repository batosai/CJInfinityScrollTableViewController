CJInfinityScrollTableViewController
=======================

Override CJInfinityScrollTableViewController and parameters controller for use infinityscroll in iOS.

It uses other libraries/classes like

* [AFNetworking](https://github.com/AFNetworking/AFNetworking)(optional)
* [PullToRefresh](https://github.com/batosai/PullToRefresh)(optional)

### PullToRefresh

For extend [PullToRefresh](https://github.com/batosai/PullToRefresh) please insert `#define _CJINFINITYSCROLL_PULLREFRESH` to the header prefix of the project (`Prefix.pch`) and include the `QuartzCore` framework.


### ARC

If you are using CJInfinityScrollTableViewController in your non-arc project, you will need to set a `-fobjc-arc` compiler flag.

To set a compiler flag in Xcode, go to your active target and select the "Build Phases" tab. Now select all CJInfinityScrollTableViewController source files, press Enter, insert `-fobjc-arc` and then "Done" to enable or disable ARC.

<img src="https://github.com/batosai/CJInfinityScrollTableViewController/raw/master/demo.gif"/>


### Creators
[Jérémy Chaufourier](http://github.com/batosai)  
[@chaufourier](https://twitter.com/chaufourier)