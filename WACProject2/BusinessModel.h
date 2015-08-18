//
//  BusinessModel.h
//  WACProject2
//
//  Created by ImpleVista on 8/17/15.
//  Copyright (c) 2015 ImpleVista. All rights reserved.
//

#import "JSONModel.h"

@protocol BusinessModel @end

@interface BusinessModel : JSONModel

@property (assign, nonatomic) int businessID;
@property (strong, nonatomic) NSString* name;

@end
