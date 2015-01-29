#import "ARArtworkPriceView.h"
#import "ARArtworkPriceRowView.h"
#import "UIView+ARDrawing.h"

@interface ARArtworkPriceView()
@end

@implementation ARArtworkPriceView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.bottomMarginHeight = 0;
    }
    return self;
}

- (void)updateWithArtwork:(Artwork *)artwork
{
    [self updateWithArtwork:artwork andSaleArtwork:nil];
}

- (void)updateWithArtwork:(Artwork *)artwork andSaleArtwork:(SaleArtwork *)saleArtwork
{
    ARArtworkPriceRowView *row = [[ARArtworkPriceRowView alloc] initWithFrame:CGRectZero];

    if (artwork.sold.boolValue) {
        row.messageLabel.textColor = [UIColor artsyRed];
        row.messageLabel.font = [UIFont sansSerifFontWithSize:row.messageLabel.font.pointSize];
        row.messageLabel.text = @"SOLD";
    } else if (saleArtwork != nil) {
        row.messageLabel.text = @"Buy Now Price:";
    } else {
        row.messageLabel.text = @"Price:";
    }

    if (artwork.availability == ARArtworkAvailabilityForSale && artwork.isPriceHidden.boolValue) {
        row.priceLabel.font = [UIFont serifItalicFontWithSize:row.priceLabel.font.pointSize];
        row.priceLabel.text = @"Contact for Price";
    } else {
        row.priceLabel.text = artwork.price;
    }

    row.margin = artwork.sold.boolValue ? 10 : 16;
    [self addSubview:row withTopMargin:@"0" sideMargin:@"0"];
    [row alignLeadingEdgeWithView:self predicate:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self drawDottedBorders];
}

@end

