//
//  Person.h
//  Persons
//
//  Created by Mathieu Lajugie on 11/9/13.
//  Copyright (c) 2013 Mathieu Lajugie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;

@end
