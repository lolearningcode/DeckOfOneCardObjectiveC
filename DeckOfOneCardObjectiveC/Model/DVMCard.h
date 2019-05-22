//
//  DVMCard.h
//  DeckOfOneCardObjectiveC
//
//  Created by Lo Howard on 5/21/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *card;
@property (nonatomic, copy, readonly) NSString *cardImageUrl;

- (instancetype) initWithName: (NSString *)name cardImageUrl:(NSString *)cardImageUrl;

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id>*)dictionary;

@end

NS_ASSUME_NONNULL_END
