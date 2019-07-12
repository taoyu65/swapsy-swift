
import UIKit
import Segmentio

struct SegmentioBuilder {
    static func startBuild(segmentioView: Segmentio,
                           segmentioStyle: SegmentioStyle,
                           segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 4),
                           plist: PlistModel) {
        segmentioView.setup(
            content: segmentioContent(plist),
            style: segmentioStyle,
            options: segmentioOptions(style: segmentioStyle, position: segmentioPosition)
        )
    }
    
    private static func segmentioContent(_ plist: PlistModel) -> [SegmentioItem] {
        var _re: [SegmentioItem] = []
        for currency in plist.currency ?? [] {
            _re.append(SegmentioItem(title: currency, image: UIImage(named: currency)))
        }
        
        return _re
    }
    
    private static func segmentioOptions(style: SegmentioStyle, position: SegmentioPosition) -> SegmentioOptions {
        var imageContentMode = UIView.ContentMode.center
        switch style {
        case .imageBeforeLabel, .imageAfterLabel:
            imageContentMode = .scaleAspectFit
        default:
            break
        }
        
        return SegmentioOptions(
            backgroundColor: .swapsyWhite,
            segmentPosition: position,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: segmentioHorizontalSeparatorOptions(),
            verticalSeparatorOptions: segmentioVerticalSeparatorOptions(),
            imageContentMode: imageContentMode,
            labelTextAlignment: .center,
            labelTextNumberOfLines: 1,
            segmentStates: segmentioStates(),
            animationDuration: 0.3
        )
    }
    
    private static func segmentioStates() -> SegmentioStates {
        let font = UIFont.swapsyFontDefault(ofSize: 13)
        return SegmentioStates(
            defaultState: SegmentioState(backgroundColor: .swapsyWhite, titleFont: font, titleTextColor: .swapsyFlatBlue),
            selectedState: SegmentioState(backgroundColor: .swapsyWhite, titleFont: font, titleTextColor: .swapsyFlatBlue),
            highlightedState: SegmentioState(backgroundColor: .swapsyWhite, titleFont: font, titleTextColor: .swapsyFlatBlue)
        )
    }
    
    private static func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 5,
            color: .swapsyFlatBlue
        )
    }
    
    private static func segmentioHorizontalSeparatorOptions() -> SegmentioHorizontalSeparatorOptions {
        return SegmentioHorizontalSeparatorOptions(
            type: .topAndBottom,
            height: 1,
            color: .swapsyWhite
        )
    }
    
    private static func segmentioVerticalSeparatorOptions() -> SegmentioVerticalSeparatorOptions {
        return SegmentioVerticalSeparatorOptions(
            ratio: 1,
            color: .swapsyWhite
        )
    }
}
