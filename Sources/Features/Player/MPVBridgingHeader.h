//
//  MPVBridgingHeader.h
//  RedLemon
//
//  Bridging header for libmpv C API
//

#ifndef MPVBridgingHeader_h
#define MPVBridgingHeader_h

#import <mpv/client.h>
#import <mpv/render.h>
#import <mpv/render_gl.h>

// MPV Event IDs
#define MPV_EVENT_NONE 0
#define MPV_EVENT_SHUTDOWN 1
#define MPV_EVENT_LOG_MESSAGE 2
#define MPV_EVENT_GET_PROPERTY_REPLY 3
#define MPV_EVENT_SET_PROPERTY_REPLY 4
#define MPV_EVENT_COMMAND_REPLY 5
#define MPV_EVENT_START_FILE 6
#define MPV_EVENT_END_FILE 7
#define MPV_EVENT_FILE_LOADED 8
#define MPV_EVENT_IDLE 11
#define MPV_EVENT_PLAYBACK_RESTART 21
#define MPV_EVENT_PROPERTY_CHANGE 22
#define MPV_EVENT_QUEUE_OVERFLOW 24
#define MPV_EVENT_VIDEO_RECONFIG 17
#define MPV_EVENT_AUDIO_RECONFIG 18

// MPV Format types
#define MPV_FORMAT_NONE 0
#define MPV_FORMAT_STRING 1
#define MPV_FORMAT_FLAG 3
#define MPV_FORMAT_INT64 4
#define MPV_FORMAT_DOUBLE 5

// Note: MPV_RENDER_API_TYPE_* and mpv_render_param_type
// are already defined in mpv/render.h

#endif /* MPVBridgingHeader_h */
