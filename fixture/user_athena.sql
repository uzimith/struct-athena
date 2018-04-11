-- Code generated by "athena_schema -type=User,Post,Comment,HttpLog -table ,post_log,,http -folder user_folder -prefix prefix/ -suffix /suffix/ ./fixture/"; DO NOT EDIT

CREATE EXTERNAL TABLE IF NOT EXISTS `user` (
  `user_id` int,
  `name` string
) PARTITIONED BY (
  `year` int,
  `month` int,
  `day` int
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://bucket/prefix/user_folder/suffix/'
;
CREATE EXTERNAL TABLE IF NOT EXISTS `post_log` (
  `author_info` struct<user_id: int, name: string>,
  `comments` array<struct<text: string, author_info: struct<user_id: int, name: string>>>,
  `two_comments` array<struct<text: string, author_info: struct<user_id: int, name: string>>>,
  `tags` array<string>,
  `created_at` timestamp,
  `updated_at` timestamp
) PARTITIONED BY (
  `year` int,
  `month` int,
  `day` int
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://bucket/prefix/post_log/suffix/'
;
CREATE EXTERNAL TABLE IF NOT EXISTS `comment` (
  `text` string,
  `author_info` struct<user_id: int, name: string>
) PARTITIONED BY (
  `year` int,
  `month` int,
  `day` int
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://bucket/prefix/comment/suffix/'
;
CREATE EXTERNAL TABLE IF NOT EXISTS `http` (
  `request_parameter` struct<method: string, url: string, http_header: map<string, array<string>>, request_body: string, query_parameter: string>,
  `response` struct<status_code: int, http_header: map<string, array<string>>, response_body: string>
) PARTITIONED BY (
  `year` int,
  `month` int,
  `day` int
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://bucket/prefix/http/suffix/'
;
