        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:352:1: error: expected expression
```
^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerView.swift:94:25: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
    var body: some View {
                        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1532:18: error: invalid redeclaration of 'checkIfAllGuestsReady()'
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1484:18: note: 'checkIfAllGuestsReady()' previously declared here
    private func checkIfAllGuestsReady() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1559:18: error: invalid redeclaration of 'startSynchronizedPlayback()'
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1511:18: note: 'startSynchronizedPlayback()' previously declared here
    private func startSynchronizedPlayback() {
                 ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1371:14: warning: case is already handled by previous patterns; consider removing it
        case .play:
             ^~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVPlayerViewModel.swift:1472:14: warning: case is already handled by previous patterns; consider removing it
        case .ready:
             ^~~~~~
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:20:21: warning: 'CAOpenGLLayer' was deprecated in macOS 10.14: OpenGL is deprecated
class MPVViewLayer: CAOpenGLLayer {
                    ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:124:19: warning: 'CGLChoosePixelFormat' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        let err = CGLChoosePixelFormat(attributes, &pix, &npix)
                  ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:136:9: warning: 'CGLCreateContext' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLCreateContext(pixelFormat, nil, &ctx)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:144:9: warning: 'CGLSetParameter' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLSetParameter(context, kCGLCPSwapInterval, &swapInterval)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:147:9: warning: 'CGLEnable' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        CGLEnable(context, kCGLCEMPEngine)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:202:9: warning: 'glClear' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:206:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_DRAW_FRAMEBUFFER_BINDING), &i)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:210:9: warning: 'glGetIntegerv' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glGetIntegerv(GLenum(GL_VIEWPORT), &dims)
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Player/MPVViewLayer.swift:237:9: warning: 'glFlush()' was deprecated in macOS 10.14: OpenGL API deprecated. (Define GL_SILENCE_DEPRECATION to silence these warnings)
        glFlush()
        ^
/Users/danielnoble/Desktop/Redlemon/Sources/Features/Rooms/LobbyViewModel.swift:700:35: warning: value 'currentMediaItem' was defined but never used; consider replacing with boolean test
                        guard let currentMediaItem = self.room.mediaItem else {
                              ~~~~^~~~~~~~~~~~~~~~~~~
                                                                         != nil

❌ Build failed on attempt 3 (exit code: 0)
ℹ️  Analyzing build failure patterns...
⚠️  Detected swift-collections related issues. This may require dependency version updates.
⚠️  Detected OrderedCollections compilation issues. A clean build may resolve this.
ℹ️  Available disk space: 19Gi

ℹ️  Suggested solutions:
   1. Run: rm -rf .build && ./start-production.sh
   2. Update Xcode/Swift toolchain
   3. Check dependency compatibility in Package.swift
   4. Verify sufficient disk space

❌ Build failed after 3 attempts
✅ Build completed successfully


✅ RedLemon is starting in PRODUCTION MODE!

📊 Services:
   ✅ Backend:           Supabase PostgreSQL
   ✅ WatchParty Server:  Port 18081 (WebSocket)
   🔐 Authentication:    Username-based

📝 Application output will appear below in real-time:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ℹ️  Preparing to launch RedLemon with watchparty server...
ℹ️  Building and starting watchparty server...

> watchparty-ws@0.0.1 start
> node dist/index.js

🚀 watchparty server listening on port 18081
🔗 WebSocket endpoint: ws://localhost:18081/ws
❤️  Health check: http://localhost:18081/healthz
✅ Watchparty server started on port 18081 (PID: 91827)
ℹ️  Removing quarantine flag...
❌ RedLemon binary not found at /Users/danielnoble/Desktop/Redlemon/build/RedLemon.app/Contents/MacOS/RedLemon
danielnoble@Daniels-MacBook-Air Redlemon %