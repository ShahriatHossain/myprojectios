//
//  BusinessManager.h
//  WACProject2
//
//  Created by ImpleVista on 8/17/15.
//  Copyright (c) 2015 ImpleVista. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "BusinessModel.h"

@interface BusinessManager : JSONModel

@property (strong, nonatomic)
NSArray<BusinessModel>* businesses;

@end
