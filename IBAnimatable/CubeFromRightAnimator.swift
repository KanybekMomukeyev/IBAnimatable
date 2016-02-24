//
//  Created by Jake Lin on 2/24/16.
//  Copyright © 2016 Jake Lin. All rights reserved.
//

import UIKit

/**
 Cube Animator, starts from right
 */
public class CubeFromRightAnimator: NSObject, UIViewControllerAnimatedTransitioning, AnimatedTransitioning {
  // MARK: - AnimatorProtocol
  var transitionAnimationType = String(TransitionAnimationType.CubeFromRight)
  var transitionDuration: Duration = .NaN
  var reverseAnimationType: String? = String(TransitionAnimationType.CubeFromLeft)

  init(transitionDuration: Duration) {
    self.transitionDuration = transitionDuration
    super.init()
  }

  public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    return transitionDuration
  }
  
  public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    guard let _ = transitionContext.viewForKey(UITransitionContextFromViewKey),
      toView = transitionContext.viewForKey(UITransitionContextToViewKey),
      containerView = transitionContext.containerView() else {
        transitionContext.completeTransition(true)
        return
    }
    
    containerView.addSubview(toView)
    CALayer.animate({
      let transition = CATransition()
      transition.type = "cube"
      transition.subtype = kCATransitionFromRight
      transition.duration = self.transitionDuration(transitionContext)
      
      containerView.layer.addAnimation(transition, forKey: kCATransition)
      }) {
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
    }
  }

}
