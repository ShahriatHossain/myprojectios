//
//  AccordionViewController.h
//  WACProject2
//
//  Created by ImpleVista on 8/14/15.
//  Copyright (c) 2015 ImpleVista. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "AccordionView.h"

@interface AccordionViewController : UIViewController {
    AccordionView *accordion;
}

@property (nonatomic,strong) NSString *passParam;


@end
