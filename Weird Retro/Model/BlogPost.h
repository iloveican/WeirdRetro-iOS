//
//  BlogPost.h
//  Weird Retro
//
//  Created by User i7 on 09/02/15.
//  Copyright (c) 2015 Alex Dougas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment;

@interface BlogPost : NSManagedObject

@property (nonatomic, retain) NSString * blogPostIdentity;
@property (nonatomic, retain) NSNumber * commentsCount;
@property (nonatomic, retain) id content;
@property (nonatomic, retain) NSDate * dateBlogPost;
@property (nonatomic, retain) NSDate * dateLastUpdated;
@property (nonatomic, retain) NSDate * dateLastView;
@property (nonatomic, retain) NSString * info;
@property (nonatomic, retain) NSString * keywords;
@property (nonatomic, retain) NSString * thumbnailUrl;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSSet *comments;

@property (nonatomic, readonly) BOOL isBlogPost;


@end

@interface BlogPost (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
