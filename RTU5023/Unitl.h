//
//  Unitl.h
//  k3
//
//  Created by amttgroup on 16/2/17.
//  Copyright © 2016年 paul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Unitl : NSObject

-(NSDictionary*)getLocalHostACCJson;
-(int)addHostACName:(NSString*)name hostNum:(NSString*)number hostPWD:(NSString*)pwd remarks:(NSString*)remarks type:(NSString*)type;
-(int)updateHostACName:(NSString*)name hostPWD:(NSString*)pwd remarks:(NSString*)remarks type:(NSString*)type newPhNum:(NSString*)new_number oldPhNum:(NSString*)old_number;
-(BOOL)delHostByphNum:(NSString*)number;
-(BOOL)setAPPPWD:(NSString*)pwd isSet:(BOOL)b;
-(NSDictionary*)getAPPSet;
//继电器输出
-(BOOL)updateSETTING_Name:(NSString*)n index:(int)i phNum:(NSString*)number;

@end
