//
//  DVMCardController.m
//  DeckOfOneCardObjectiveC
//
//  Created by Lo Howard on 5/21/19.
//  Copyright © 2019 Lo Howard. All rights reserved.
//

#import "DVMCardController.h"

@implementation DVMCardController

+ (void)drawANewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<DVMCard *> * _Nullable))completion
{
    NSString *cardCount = [@(numberOfCards) stringValue];
    NSURL *baseURL = [NSURL URLWithString:@"https://deckofcardsapi.com/api/deck/new/draw/"];
    NSURLComponents *componentsWithURL = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *queryItemWithName = [NSURLQueryItem queryItemWithName:@"count" value:cardCount];
    componentsWithURL.queryItems = @[componentsWithURL, queryItemWithName];
    NSURL *fullURL = componentsWithURL.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:fullURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data) {
            NSDictionary *cardDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *cardsArray = cardDictionaries[@"cards"];
            DVMCard *card = [[DVMCard alloc] initWithDictionary:cardsArray];
            completion(cardsArray); return;
        }
    }] resume];
}

+ (void)fetchCardImage:(NSString *)urlString completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"%@", [url absoluteString]);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (data) {
            UIImage *cardImage = [UIImage imageWithData:data];
            completion(cardImage);
            return;
        }
        completion(nil);
    }] resume];
}
@end
