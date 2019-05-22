//
//  DVMCardController.h
//  DeckOfOneCardObjectiveC
//
//  Created by Lo Howard on 5/21/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVMCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

+ (DVMCardController *) shared;

+ (void) drawANewCard: (NSInteger)numberOfCards completion: (void(^) (NSArray<DVMCard *> *_Nullable))completion;

+ (void) fetchCardImage: (NSString *)urlString completion: (void (^) (UIImage * _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
