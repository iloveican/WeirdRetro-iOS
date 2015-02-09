//
//  WRPage.h
//  Weird Retro
//
//  Created by User i7 on 05/02/15.
//  Copyright (c) 2015 Alex Dougas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HTMLReader/HTMLReader.h>


typedef NS_ENUM(NSUInteger, PageType) {
    PageTypeMemories,
    PageTypePost,
    PageTypeBlogPage,
    PageTypeBlogPost
};


@interface WRPage : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSString* info;
@property (strong, nonatomic) NSString* keywords;
@property (strong, nonatomic) NSString* thumbnailUrl;

@property (strong, nonatomic) NSArray* items;

@property (strong, nonatomic) NSString* blogPostDate;

@property (assign, nonatomic) NSInteger blogPostCountComments;
@property (strong, nonatomic) NSString* blogPostId;
@property (strong, nonatomic) NSString* blogUserId;
@property (strong, nonatomic) NSString* blogBlogId;
@property (strong, nonatomic) NSArray* blogComments;

@property (assign, nonatomic) PageType type;

//- (id) initWithHTML:(NSString*)htmlMarkup;

@end
