package dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@ToString
public class BookmarkDTO {
    private int id;
    private String mgrNo;
    private int bookmarkId;
    private String regDt;
}
