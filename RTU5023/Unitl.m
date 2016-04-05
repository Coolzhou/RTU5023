//
//  unitl.m
//  k3
//
//  Created by amttgroup on 16/2/17.
//  Copyright © 2016年 paul. All rights reserved.
//

#import "Unitl.h"
#import "AppDelegate.h"

@implementation Unitl

AppDelegate *app_unitl;

-(id)init
{
    self = [super init];
    if (self) {
        app_unitl = [[UIApplication sharedApplication] delegate];
    }
    return self;
}

-(NSDictionary*)getLocalHostACCJson
{
    NSString *path = [NSString stringWithFormat:@"%@/host_data.json",app_unitl.documentDirectory];
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data == nil || data.length <= 0){
        return nil;
    }
    
    NSError *e;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
    if (e) {
        NSLog(@"ERROR! %@",e);
        return nil;
    }
    return json;
}

-(int)addHostACName:(NSString*)name hostNum:(NSString*)number hostPWD:(NSString*)pwd remarks:(NSString*)remarks type:(NSString*)type{
    NSMutableDictionary *datas = (NSMutableDictionary*)[self getLocalHostACCJson];
    NSMutableArray *hosts;
    if (datas == nil) {
        NSLog(@"datas is nil!!!!!!!!!!!!");
        datas = [NSMutableDictionary dictionary];
        hosts = [NSMutableArray new];
    }else{
        hosts = [datas objectForKey:@"hosts"];
        for (NSDictionary *d in hosts) {
            NSString *num = [d objectForKey:@"host_number"];
            if ([number isEqualToString:num]) {
                NSLog(@"add failed ! number %@ is EXISTS",number);
                return -1;
            }
            NSString *n = [d objectForKey:@"host_name"];
            if ([name isEqualToString:n]) {
                NSLog(@"add failed ! name %@ is EXISTS",name);
                return -2;
            }
        }
    }
    
    NSMutableDictionary *host_dic = [NSMutableDictionary dictionary];
    [host_dic setObject:name forKey:@"host_name"];
    [host_dic setObject:number forKey:@"host_number"];
    [host_dic setObject:pwd forKey:@"host_pwd"];
    [host_dic setObject:remarks forKey:@"remarks"];
    [host_dic setObject:type forKey:@"type"];
    
    [host_dic setObject:@"Temperature" forKey:@"host_t"];
    [host_dic setObject:@"Humidty" forKey:@"host_h"];
    [host_dic setObject:@"Voltage" forKey:@"host_v"];
    
    [hosts addObject:host_dic];
    [datas setObject:hosts forKey:@"hosts"];
    
    NSString *dic = [self jsonStringWithDictionary:datas];
    NSData *data =  [dic dataUsingEncoding:NSUTF8StringEncoding];
    [self writeDatasToFile:data fileName:@"host_data.json"];
    return 1;
}

-(int)updateHostACName:(NSString*)name hostPWD:(NSString*)pwd remarks:(NSString*)remarks type:(NSString*)type newPhNum:(NSString*)new_number oldPhNum:(NSString*)old_number {
    NSMutableDictionary *datas = (NSMutableDictionary*)[self getLocalHostACCJson];
    NSMutableArray *hosts;
    if (datas == nil) {
        NSLog(@"datas is nil!!!!!!!!!!!!");
        return NO;
    }else{
        hosts = [datas objectForKey:@"hosts"];
        hosts = [datas objectForKey:@"hosts"];
        for (NSDictionary *d in hosts) {
            NSString *num = [d objectForKey:@"host_number"];
            if ([new_number isEqualToString:num] && ![old_number isEqualToString:num]) {
                NSLog(@"add failed ! number %@ is EXISTS",new_number);
                return -1;
            }
            NSString *n = [d objectForKey:@"host_name"];
            if ([name isEqualToString:n] && ![old_number isEqualToString:num] ) {
                NSLog(@"add failed ! name %@ is EXISTS",name);
                return -2;
            }
        }
        
        
        for (NSMutableDictionary *d in hosts) {
            NSString *num = [d objectForKey:@"host_number"];
            if ([old_number isEqualToString:num]) {
                [d setObject:name forKey:@"host_name"];
                [d setObject:new_number forKey:@"host_number"];
                [d setObject:pwd forKey:@"host_pwd"];
                [d setObject:remarks forKey:@"remarks"];
                [d setObject:type forKey:@"type"];
            
                NSString *js = [self jsonStringWithDictionary:datas];
                NSData *data = [js dataUsingEncoding:NSUTF8StringEncoding];
                [self writeDatasToFile:data fileName:@"host_data.json"];
                return 1;
            }
        }
        return 0;
    }
}


-(BOOL)updateSETTING_Name:(NSString*)n index:(int)i phNum:(NSString*)number {
    NSMutableDictionary *datas = (NSMutableDictionary*)[self getLocalHostACCJson];
    NSMutableArray *hosts;
    if (datas == nil) {
        NSLog(@"datas is nil!!!!!!!!!!!!");
        return NO;
    }else{
        hosts = [datas objectForKey:@"hosts"];
        hosts = [datas objectForKey:@"hosts"];
        
        for (NSMutableDictionary *d in hosts) {
            NSString *num = [d objectForKey:@"host_number"];
            if ([number isEqualToString:num]) {
                switch (i) {
                    case 1:
                        [d setObject:n forKey:@"host_t"];
                        break;
                    case 2:
                        [d setObject:n forKey:@"host_h"];
                        break;
                    case 3:
                        [d setObject:n forKey:@"host_v"];
                        break;
                        
                    default:
                        break;
                }
                
                NSString *js = [self jsonStringWithDictionary:datas];
                NSData *data = [js dataUsingEncoding:NSUTF8StringEncoding];
                [self writeDatasToFile:data fileName:@"host_data.json"];
                return YES;
            }
        }
        return NO;
    }
    
}

-(BOOL)delHostByphNum:(NSString*)number
{
    NSMutableDictionary *datas = (NSMutableDictionary*)[self getLocalHostACCJson];
    NSMutableArray *hosts;
    if (datas == nil) {
        NSLog(@"datas is nil!!!!!!!!!!!!");
        return NO;
    }else{
        hosts = [datas objectForKey:@"hosts"];
        for (NSMutableDictionary *d in hosts) {
            NSString *num = [d objectForKey:@"host_number"];
            if ([number isEqualToString:num]) {
                [hosts removeObject:d];
                
                NSString *js = [self jsonStringWithDictionary:datas];
                NSData *data = [js dataUsingEncoding:NSUTF8StringEncoding];
                [self writeDatasToFile:data fileName:@"host_data.json"];
                return YES;
            }
        }
        return NO;
    }
}


-(BOOL)setAPPPWD:(NSString*)pwd isSet:(BOOL)b {
    NSMutableDictionary *datas = (NSMutableDictionary*)[self getLocalHostACCJson];
    if (datas == nil) {
        NSLog(@"datas is nil!!!!!!!!!!!!");
        datas = [NSMutableDictionary dictionary];
    }
    [datas setObject:pwd forKey:@"app_pwd"];
    [datas setObject:b ? @"1" : @"0" forKey:@"isSet"];
    NSString *dic = [self jsonStringWithDictionary:datas];
    NSData *data =  [dic dataUsingEncoding:NSUTF8StringEncoding];
    [self writeDatasToFile:data fileName:@"APP_setPWDdata.json"];
    
    return YES;
}


-(NSDictionary*)getAPPSet {
    NSString *path = [NSString stringWithFormat:@"%@/APP_setPWDdata.json",app_unitl.documentDirectory];
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data == nil || data.length <= 0){
        return nil;
    }
    
    NSError *e;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
    if (e) {
        NSLog(@"ERROR! %@",e);
        return nil;
    }
    return json;
}



-(void)writeDatasToFile:(NSData *)data fileName:(NSString*)name
{
    if (data == nil)
        return;
    NSString *path = [NSString stringWithFormat:@"%@/%@",app_unitl.documentDirectory, name];
    [data writeToFile:path atomically:NO];
}


-(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSArray *keys = [dictionary allKeys];
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"{"];
    NSMutableArray *keyValues = [NSMutableArray array];
    for (int i=0; i<[keys count]; i++) {
        NSString *name = [keys objectAtIndex:i];
        id valueObj = [dictionary objectForKey:name];
        NSString *value = [self jsonStringWithObject:valueObj];
        if (value) {
            [keyValues addObject:[NSString stringWithFormat:@"\"%@\":%@",name,value]];
        }
    }
    [reString appendFormat:@"%@",[keyValues componentsJoinedByString:@","]];
    [reString appendString:@"}"];
    return reString;
}

-(NSString *) jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [self jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [self jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [self jsonStringWithArray:object];
    }
    return value;
}

-(NSString *) jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [self jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

-(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}


@end
