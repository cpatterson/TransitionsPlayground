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

See a movie of the transition here:<br>
http://f.cl.ly/items/3S3Z0D3L0n1T0P3b1j0M/MyFirstTransition.mov
