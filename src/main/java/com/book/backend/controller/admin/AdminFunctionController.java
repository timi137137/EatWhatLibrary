package com.book.backend.controller.admin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.book.backend.common.BasePage;
import com.book.backend.common.R;
import com.book.backend.pojo.*;
import com.book.backend.pojo.dto.*;
import com.book.backend.service.*;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("admin")
public class AdminFunctionController {
    @Resource
    private BooksService booksService;
    @Resource
    private BookTypeService bookTypeService;
    @Resource
    private UsersService usersService;
    @Resource
    private BookRuleService bookRuleService;
    @Resource
    private ViolationService violationService;
    @Resource
    private AdminsService adminsService;
    @Resource
    private BooksBorrowService booksBorrowService;
    @Resource
    private NoticeService noticeService;

    /**
     * 借阅图书根据借阅证号和图书编号
     *
     * @return R
     */
    @ApiOperation("图书借阅")
    @PostMapping("borrow_book")
    public R<String> borrowBookByCardNumberAndBookNumber(@RequestBody BooksBorrowDTO booksBorrowDTO) {
        return booksService.borrowBookByCardNumberAndBookNumber(booksBorrowDTO);
    }

    /**
     * 查看图书是否有逾期(查看是否借出)
     *
     * @param bookNumber 图书编号
     * @return R
     */
    @ApiOperation("查询图书状态")
    @GetMapping("query_book/{bookNumber}")
    public R<String> queryBookExpireByBookNumber(@PathVariable("bookNumber") Long bookNumber) {
        return booksService.queryBookExpireByBookNumber(bookNumber);
    }

    /**
     * 获取图书逾期信息
     *
     * @param bookNumber 图书编号
     * @return R<Violation>
     */
    @ApiOperation("查询图书逾期信息")
    @GetMapping("query_expire/{bookNumber}")
    public R<ViolationDTO> queryExpireInformationByBookNumber(@PathVariable("bookNumber") Long bookNumber) {
        return booksBorrowService.queryExpireInformationByBookNumber(bookNumber);
    }

    /**
     * 归还图书
     *
     * @param violation 违章表
     * @return R
     */
    @ApiOperation("归还图书")
    @PostMapping("return_book")
    public R<String> returnBook(@RequestBody Violation violation) {
        return booksBorrowService.returnBook(violation);
    }

    /**
     * 获取公告列表
     *
     * @return R<Notice>
     */
    @ApiOperation("获取公告列表")
    @PostMapping("get_noticelist")
    public R<Page<Notice>> getNoticeList(@RequestBody BasePage basePage) {
        return noticeService.getNoticeList(basePage);
    }

    /**
     * 添加公告
     *
     * @param notice 公告
     * @return R<String>
     */
    @ApiOperation("添加公告")
    @PostMapping("add_notice")
    public R<String> addNotice(@RequestBody Notice notice) {
        return noticeService.addNotice(notice);
    }

    /**
     * 删除公告根据指定的id
     *
     * @param noticeId 公告id
     * @return R
     */
    @ApiOperation("删除公告")
    @GetMapping("delete_notice/{noticeId}")
    public R<String> deleteNoticeById(@PathVariable("noticeId") Integer noticeId) {
        return noticeService.deleteNoticeById(noticeId);
    }

    /**
     * 根据指定id获取公告
     *
     * @param noticeId 公告id
     * @return R<Notice>
     */
    @ApiOperation("获取公告")
    @GetMapping("get_notice/{noticeId}")
    public R<Notice> getNoticeByNoticeId(@PathVariable("noticeId") Integer noticeId) {
        return noticeService.getNoticeByNoticeId(noticeId);
    }

    /**
     * 更新公告根据公告id
     *
     * @param noticeId 公告id
     * @param notice   公告
     * @return R
     */
    @ApiOperation("更新公告")
    @PutMapping("update_notice/{noticeId}")
    public R<String> updateNoticeByNoticeId(@PathVariable("noticeId") Integer noticeId, @RequestBody Notice notice) {
        return noticeService.updateNoticeByNoticeId(noticeId, notice);
    }

    /**
     * 获取图书列表
     *
     * @param basePage 页码，页数，条件和内容
     * @return R<Page < Books>>
     */
    @ApiOperation("获取图书列表")
    @PostMapping("get_booklist")
    public R<Page<Books>> getBookList(@RequestBody BasePage basePage) {
        return booksService.getBookList(basePage);
    }

    /**
     * 查询书籍类型的列表 用于添加图书中回显分类
     *
     * @return R<BookType>
     */
    @ApiOperation("查询书籍类型列表")
    @GetMapping("get_type")
    public R<List<BookType>> getBookTypeList() {
        return bookTypeService.getBookTypeList();
    }

    /**
     * 添加图书 利用DTO去接受 书籍类别的id 然后再通过id查询分类表获取分类名称 封装给图书
     *
     * @return R
     */
    @ApiOperation("添加图书")
    @PostMapping("add_book")
    public R<String> addBook(@RequestBody BookDTO bookDTO) {
        return booksService.addBook(bookDTO);
    }

    /**
     * 根据图书id删除对应的图书
     *
     * @param bookId 图书id
     * @return R
     */
    @ApiOperation("删除图书")
    @GetMapping("delete_book/{bookId}")
    public R<String> deleteBookByBookId(@PathVariable("bookId") Integer bookId) {
        return booksService.deleteBookByBookId(bookId);
    }

    /**
     * 根据图书id获得相对应的图书信息
     *
     * @param bookId 图书id
     * @return R<Books>
     */
    @ApiOperation("获取图书信息")
    @GetMapping("get_bookinformation/{bookId}")
    public R<Books> getBookInformationByBookId(@PathVariable("bookId") Integer bookId) {
        return booksService.getBookInformationByBookId(bookId);
    }

    /**
     * 根据前端传输的图书信息更新图书
     *
     * @param books 图书
     * @return R
     */
    @ApiOperation("更新图书信息")
    @PostMapping("update_book")
    public R<String> updateBookByEditForm(@RequestBody Books books) {
        return booksService.updateBookByEditForm(books);
    }

    /**
     * 书籍类别 获取书籍类别的列表
     *
     * @return R<List < BookType>>
     */
    @ApiOperation("获取书籍类别的列表")
    @PostMapping("get_booktype_page")
    public R<Page<BookType>> getBookTypeListByPage(@RequestBody BasePage basePage) {
        return bookTypeService.getBookTypeListByPage(basePage);
    }

    /**
     * 添加书籍类别
     *
     * @param bookType 书籍类别
     * @return R
     */
    @ApiOperation("添加书籍类别")
    @PostMapping("add_booktype")
    public R<String> addBookType(@RequestBody BookType bookType) {
        return bookTypeService.addBookType(bookType);
    }

    /**
     * 根据书籍类别id 获取书籍类别信息
     *
     * @param typeId 书籍类别id
     * @return R
     */
    @ApiOperation("获取书籍类别信息")
    @GetMapping("get_booktype/{typeId}")
    public R<BookType> getBookTypeByTypeId(@PathVariable("typeId") Integer typeId) {
        return bookTypeService.getBookTypeByTypeId(typeId);
    }

    /**
     * 更新书籍类别
     *
     * @param bookType 书籍类别
     * @return R
     */
    @ApiOperation("更新书籍类别信息")
    @PostMapping("update_booktype")
    public R<String> updateBookType(@RequestBody BookType bookType) {
        return bookTypeService.updateBookType(bookType);
    }

    /**
     * 删除书籍类别 根据书籍类别的ID
     *
     * @param typeId 书籍类别的id
     * @return R
     */
    @ApiOperation("删除书籍类别")
    @GetMapping("delete_booktype/{typeId}")
    public R<String> deleteBookTypeByTypeId(@PathVariable("typeId") Integer typeId) {
        return bookTypeService.deleteBookTypeByTypeId(typeId);
    }

    /**
     * 获取借阅证列表(用户列表)
     *
     * @param basePage 用于接受模糊查询和分页构造的参数
     * @return R<Page < Users>>
     */
    @ApiOperation("获取借阅证列表(用户列表)")
    @PostMapping("get_statementlist")
    public R<Page<Users>> getStatementList(@RequestBody BasePage basePage) {
        return usersService.getStatementList(basePage);
    }

    /**
     * 添加借阅证
     *
     * @param usersDTO 用户DTO
     * @return R<String>
     */
    @ApiOperation("添加借阅证")
    @PostMapping("add_statement")
    public R<String> addStatement(@RequestBody UsersDTO usersDTO) {
        return adminsService.addRule(usersDTO);
    }

    /**
     * 获取用户信息 根据用户id  用于回显借阅证
     *
     * @param userId 用户id
     * @return R<UsersDTO>
     */
    @ApiOperation("获取用户信息")
    @GetMapping("get_statement/{userId}")
    public R<UsersDTO> getStatementByUserId(@PathVariable("userId") Integer userId) {
        return usersService.getStatementByUserId(userId);
    }

    /**
     * 修改借阅证信息(用户信息)
     *
     * @param usersDTO 用户DTO
     * @return R
     */
    @ApiOperation("更新借阅证信息")
    @PostMapping("update_statement")
    public R<String> updateStatement(@RequestBody UsersDTO usersDTO) {
        return usersService.updateStatement(usersDTO);
    }

    /**
     * 删除借阅证信息 根据用户id
     *
     * @param userId 用户id
     * @return R
     */
    @ApiOperation("删除借阅证信息")
    @DeleteMapping("delete_statement/{userId}")
    public R<String> deleteStatementByUserId(@PathVariable("userId") Integer userId) {
        return usersService.deleteStatementByUserId(userId);
    }

    /**
     * 获取规则列表(分页)
     *
     * @param basePage 分页构造器用于接受页数和页码
     * @return R<Page<BookRule>>
     */
    @ApiOperation("分页获取图书规则列表")
    @PostMapping("get_rulelist_page")
    public R<Page<BookRule>> getRuleListByPage(@RequestBody BasePage basePage) {
        return bookRuleService.getRuleListByPage(basePage);
    }

    /**
     * 添加规则
     *
     * @param bookRule 图书规则
     * @return R
     */
    @ApiOperation("添加图书规则")
    @PostMapping("add_rule")
    public R<String> addRule(@RequestBody BookRule bookRule) {
        return bookRuleService.addRule(bookRule);
    }

    /**
     * 根据规则编号查询规则
     *
     * @param ruleId 规则编号
     * @return R<BookRule>
     */
    @ApiOperation("查询图书规则")
    @GetMapping("get_rule_ruleid/{ruleId}")
    public R<BookRuleDTO> getRuleByRuleId(@PathVariable("ruleId") Integer ruleId) {
        return bookRuleService.getRuleByRuleId(ruleId);
    }

    /**
     * 修改规则
     *
     * @param bookRuleDTO 图书规则
     * @return R
     */
    @ApiOperation("修改图书规则")
    @PutMapping("update_rule")
    public R<String> updateRule(@RequestBody BookRuleDTO bookRuleDTO) {
        return bookRuleService.updateRule(bookRuleDTO);
    }

    /**
     * 删除规则
     *
     * @param ruleId 规则编号
     * @return R
     */
    @ApiOperation("删除图书规则")
    @DeleteMapping("delete_rule/{ruleId}")
    public R<String> deleteRule(@PathVariable("ruleId") Integer ruleId) {
        return bookRuleService.deleteRule(ruleId);
    }

    /**
     * 获取借阅量
     *
     * @return R<BorrowData>
     */
    @ApiOperation("获取借阅量")
    @GetMapping("get_borrowdata")
    public R<BorrowData> getBorrowDate() {
        return violationService.getBorrowDate();
    }

    /**
     * 获取借书分类统计情况
     *
     * @return R<List<BorrowTypeDTO>>
     */
    @ApiOperation("获取借书分类统计情况")
    @GetMapping("get_borrowtype_statistics")
    public R<List<BorrowTypeDTO>> getBorrowTypeStatistic() {
        return booksService.getBorrowTypeStatistic();
    }

    /**
     * 批量删除图书
     *
     * @param booksList 图书列表
     * @return R<String>
     */
    @ApiOperation("批量删除图书")
    @DeleteMapping("delete_book_batch")
    public R<String> deleteBookByBatch(@RequestBody List<Books> booksList) {
        return booksService.deleteBookByBatch(booksList);
    }
}
