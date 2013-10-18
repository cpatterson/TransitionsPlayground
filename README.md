TransitionsPlayground
=====================

A modification of the master-detail Xcode template to
provide a custom transition animation from a table view cell to the
detail view using the new view controller transitions APIs in iOS 7.

### Differences from the Xcode Master-Detail iOS Project Template

- CPTransitionAnimator class added to provide the custom transition animation.

- Modified CPMasterViewController -prepareForSegue:sender: method to store selected cell's frame.

- Made CPMasterViewController the delegate of its navigationController.

- Added UINavigationControllerDelegate method to init and return CPTransitionAnimator instance.

Here is a movie of the custom animation in action:
<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" height="300">
<param name="src" value="http://f.cl.ly/items/3S3Z0D3L0n1T0P3b1j0M/MyFirstTransition.mov" />
<param name="controller" value="true" />
<object type="video/quicktime" data="http://f.cl.ly/items/3S3Z0D3L0n1T0P3b1j0M/MyFirstTransition.mov" height="300" class="mov">
<param name="controller" value="true" />
</object>
</object>

